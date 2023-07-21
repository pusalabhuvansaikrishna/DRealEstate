pragma solidity 0.4.18;

contract land
{
    uint temp;
    struct bhoomi
    {
        string owner_name;
        ///string full_address;
        string state;
        string district;
        string mandal;
        string village;
        uint cost;
        int area;
        ///string facing;
    }
    mapping(string=>bhoomi) land_info;
    function addlandInfo(string Survey_no,string Owner_Name,string State,string District,string Mandal,string Village,uint Price,int Area) public
    {
        land_info[Survey_no].owner_name=Owner_Name;
        land_info[Survey_no].state=State;
        land_info[Survey_no].district=District;
        land_info[Survey_no].mandal=Mandal;
        land_info[Survey_no].village=Village;
        land_info[Survey_no].cost=Price;
        land_info[Survey_no].area=Area;
        temp=land_info[Survey_no].cost;
        ///land_info[Survey_no].facing=Facing;
    }
    function showinfo(string Survey_no)public view returns(string,string,string,string,string,uint,int)
    {
        return(land_info[Survey_no].owner_name,
        land_info[Survey_no].state,
        land_info[Survey_no].district,
        land_info[Survey_no].mandal,
        land_info[Survey_no].village,
        land_info[Survey_no].cost,
        land_info[Survey_no].area);
    }
    /*
    function invest() external payable
    {
        if(msg.value!= temp)
        {
            revert();
        }
    }
    */
    function show()external view returns(uint)
    {
            return(this).balance;
    }
}