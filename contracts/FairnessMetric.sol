
pragma solidity ^0.8.20;

contract FairnessMetric {

    function fairnessVariance(uint256[] memory roleGas)
        public
        pure
        returns (uint256)
    {
        uint256 mean = 0;
        uint256 variance = 0;

        for (uint i = 0; i < roleGas.length; i++) {
            mean += roleGas[i];
        }

        mean = mean / roleGas.length;

        for (uint i = 0; i < roleGas.length; i++) {
            uint256 diff = roleGas[i] > mean ? roleGas[i] - mean : mean - roleGas[i];
            variance += diff * diff;
        }

        variance = variance / roleGas.length;

        return variance;
    }
}
