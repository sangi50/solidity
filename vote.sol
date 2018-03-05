pragma solidity ^0.4.0;
contract vote{
    struct a {
        string cname;
        uint256 cid;
        uint256 count;
    }
    struct b {
        uint256 vid;
        
    }
    mapping(uint256=>a)can;
    mapping(uint256=>b)pub;
    address owner;
    modifier check(uint256 voterid) {
        require(pub[voterid].vid!=voterid);
        _;
    }
    function vote () {
        owner=msg.sender;
    }
    modifier onlyOwner() {
        require(owner==msg.sender);
        _;
    }
    function candidate_Details(string name,uint256 id) public onlyOwner {
        can[id].cid=id;
        can[id].cname=name;
    }
    function Voting(uint256 voterid,uint256 candidateid) public check(voterid){
        pub[voterid].vid=voterid;
        can[candidateid].count+=1;
    }
    function Result(uint256 candidateid) public constant returns(uint256,string) {
        return(can[candidateid].count,can[candidateid].cname);
    }
    function winner()public constant returns(string){
        if(can[1].count>can[2].count&&can[1].count>can[2].count) {
            return"candidate 1 is winner";
        }
         else if(can[2].count>can[1].count&&can[2].count>can[3].count) {
            return"candidate 2 is winner";
        }
         else if(can[3].count>can[1].count&&can[3].count>can[2].count) {
            return"candidate 3 is winner";
        }
        else if((can[1].count==can[2].count)&&(can[1].count==can[3].count)&&(can[2].count==can[3].count)) {
            return"draw";
        }
        
        
    }
}
