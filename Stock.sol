pragma solidity ^0.4.0;
contract aa{
    address own;
    struct a {
        string pname;
        uint256 pid;
        uint256 pprice;
        uint256 count;
     }
    mapping (address=>a)pro;
    struct b {
        uint256 userid;
        uint256 count;
        uint256 bal;
        }
    uint256 t;
    modifier ch(uint256 pid) {
        require(pro[own].pid==pid);
        _;
    }
    function getitem (uint256 pid,uint256 pprice,string pname,uint256 count)public {
        pro[own].pid=pid;
        pro[own].pprice=pprice;
        pro[own].pname=pname;
        pro[own].count=count;
      
    }
    mapping(uint256=>b)pur;
  
    function shop(uint256 userid,uint256 pid,uint256 count)public ch(pid) {
       
        pur[userid].userid=userid;
        pro[own].pid=pid;
        pur[userid].count=count;
         pro[own].count=(pur[userid].bal= pro[own].count- pur[userid].count);
       //pro[own].count= pur[userid].bal;
     
    }
    function ret(uint256 userid,uint256 pid)public ch(pid) constant returns(uint256,uint256) 
    {
          return ( pro[own].pprice*pur[userid].count,pur[userid].bal);
    }
 
}
