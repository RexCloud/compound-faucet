pragma solidity >=0.7.0 <0.9.0;

interface  ICaller{

    function drip(address _address) external;
    function transfer(address _to, uint256 _value) external payable;

}

contract Minter {

    address target = 0x9C3F0FC85EF9144412388e7E952eb505e2c4a10F;
    address uniswap = 0xC8F88977E21630Cf93c02D02d9E8812ff0DFC37a;

    uint loopAmount;
    uint k = 0;

    function setLoopAmount(uint _loopAmount) public {
        loopAmount = _loopAmount;
    }

    function currentLoopAmount() public view returns(uint) {
        return loopAmount;
    }

    function execDrip(address _address) external {
        while(k <= loopAmount) {
            ICaller(target).drip(_address);
            k++;
            }
    }

    function transfer(address _to, uint256 _value) external {
        ICaller(uniswap).transfer(_to, _value);
    }

}
