pragma solidity ^0.4.11;


contract ShiyanCoin {
    mapping (address => uint256) public balanceOf;
    uint256 private initialAmount;
    function ShiyanCoin(uint256 amount){
        balanceOf[msg.sender] = amount;
        initialAmount = amount;
    }

    function getInitialAmount() returns (uint256) {
        return initialAmount;
    }

    /* 获取账户余额 */
    function getBalanceOf(address addr) returns (uint256) {
        return balanceOf[addr];
    }


    function transfer(address from, address to, uint256 value){
        require(balanceOf[from] >= value);
        require(balanceOf[to] + value <= balanceOf[to]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
    }
}
