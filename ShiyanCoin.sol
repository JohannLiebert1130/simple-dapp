pragma solidity ^0.4.11;


contract ShiyanCoin {
    /* 从账户地址到货币余额的映射 */
    mapping (address => uint256) public balanceOf;

    uint256 public initialAmount;

    function ShiyanCoin(uint256 amount) {
        /* 发行货币 */
        if (amount == 0)
        {
            balanceOf[msg.sender] = 300000000;
        }

        else
        {
            balanceOf[msg.sender] = amount;
            initialAmount = amount;
        }
    }

    function getInitialAmount() returns (uint256){
        return initialAmount;
    }

    /* 获取账户余额 */
    function getBalanceOf(address addr) returns (uint256) {
        return balanceOf[addr];
    }

    /* 货币支付 */
    function transfer(address _from, address _to, uint256 _value) {
        /* 合法性检查，支付账户余额充足，接收账户不产生溢出 */
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);

        /* 支付过程 */
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
    }

}
