pragma solidity 0.8.15;

contract Transfer
{
    uint public value;
    address payable seller;
    address payable buyer;

    enum State {Created, Locked, Released, Inactive}
    State public state;

    constructor () payable 
    {
        seller = payable(msg.sender);
        value  = msg.value;
    }

    /// the function cannot be called at the current state(invalid state).
    error InvalidState();

    modifier inState(State state_)
    {
        if(state != state_)
        {
            revert InvalidState();
        }
        _;
    }
    
    /// only buyer can call this function 
    error OnlyBuyer();

    modifier onlyBuyer()
    {
        if(msg.sender != buyer)
        {
            revert OnlyBuyer();
        }
        _;
    }

    /// only seller can call this function.
    error OnlySeller();

    modifier onlySeller() 
    {
        if(msg.sender != seller)
        {
            revert OnlySeller();
        }
        _;
    }
    function setValue(uint _value) public
    {
        value = _value;
    } 

    function confirmPayment() external inState(State.Created) payable
    {
        require(msg.value == value,"please send the correct purchase amount");
        buyer = payable(msg.sender);
        state = State.Locked;
    } 

    function confirmRecieved() external onlyBuyer inState(State.Locked)
    {
        state = State.Released;
        buyer.transfer(value);
    }

    function payseller() external onlySeller inState(State.Released)  
    {
        state = State.Inactive;
        seller.transfer(value);
    }

    function Abort() external onlySeller inState(State.Created)
    {
        state = State.Inactive;
        seller.transfer(address(this).balance);
    }
    function Getbal() view public returns(uint)
    {
        return address(this).balance;
    }

}