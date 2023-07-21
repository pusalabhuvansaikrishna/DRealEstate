pragma solidity 0.4.18;

contract seller
{
    struct information
    {
        uint phone_number;
        string dob;
        string add;
        string spouse;
        uint noc;
        string adhar_no;
        string pancard_no;
    }
    mapping(string=>information) land_seller;
    function setdata(string Name,uint Phone_Number,string Date_of_birth,string Address,string Spouse,uint No_of_Chidren,string Adhar_Card_No,string Pan_Card_No) public
    {
        land_seller[Name].phone_number=Phone_Number;
        land_seller[Name].dob=Date_of_birth;
        land_seller[Name].add=Address;
        land_seller[Name].spouse=Spouse;
        land_seller[Name].noc=No_of_Chidren;
        land_seller[Name].adhar_no=Adhar_Card_No;
        land_seller[Name].pancard_no=Pan_Card_No;
    }
    function getdata(string Name) public view returns(uint,string,string,string,uint,string,string)
    {
        return(land_seller[Name].phone_number,
        land_seller[Name].dob,
        land_seller[Name].add,
        land_seller[Name].spouse,
        land_seller[Name].noc,
        land_seller[Name].adhar_no,
        land_seller[Name].pancard_no);
    }
}
