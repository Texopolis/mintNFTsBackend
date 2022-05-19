// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";

contract SvgColors {
    string[] backgroundColorArr = [
        "#d46153",
        "#f6ed7f",
        "#c0ac61",
        "#9f7d5c",
        "#128a75",
        "#7aa08c",
        "#e1ddae",
        "#5d8789",
        "#45b59e",
        "#dabea4",
        "#c96751",
        "#c64341",
        "#175767",
        "#518c93",
        "#88b2a7",
        "#e9e9ca",
        "#e1c8b0",
        "#4d9472",
        "#dfae3e",
        "#d9802f",
        "#ef7d33",
        "#42909d",
        "#6ae4de",
        "#f8eac6",
        "#fb9084",
        "#da717a",
        "#988f81",
        "#fef5ae",
        "#63482c",
        "#0d5558",
        "#4fb0a4",
        "#e0c182",
        "#a97374",
        "#e04a50",
        "#d39237",
        "#b5ae5f",
        "#65aaad",
        "#dc393e",
        "#438082",
        "#49908b",
        "#6b8180",
        "#5eb4b8",
        "#469b48",
        "#b0c84e",
        "#faf5cc",
        "#cd5f47",
        "#fda98f",
        "#f3aa91",
        "#b4d5c8",
        "#3adfd5",
        "#16b39e",
        "#806962",
        "#807f83",
        "#a2bac8",
        "#cce68a",
        "#277465",
        "#218d6f",
        "#4e9585",
        "#066876",
        "#2c786b",
        "#354d51",
        "#468485",
        "#93cde2",
        "#f7e9d3",
        "#fcf3da",
        "#fe0750",
        "#82dbd7",
        "#9ecd42",
        "#24967b",
        "#2e6879",
        "#a08e6f",
        "#d8bc90",
        "#edf1b9",
        "#6d6d7c",
        "#a9a18c",
        "#d7c2b5",
        "#f6f3ef"
    ];
    string[] c1 = ["#d46153", "#f6ed7f", "#c0ac61", "#9f7d5c", "#4b3e49"];
    string[] c2 = ["#953365", "#3a4954", "#128a75", "#7aa08c", "#e1ddae"];
    string[] c3 = ["#e2d53e", "#84283c", "#601234", "#3c1330", "#252016"];
    string[] c4 = ["#636237", "#c1d0be", "#abb0a2", "#a16e73", "#5d2830"];
    string[] c5 = ["#5d8789", "#45b59e", "#dabea4", "#c96751", "#c64341"];
    string[] c6 = ["#175767", "#518c93", "#88b2a7", "#e9e9ca", "#e1c8b0"];
    string[] c7 = ["#4d1c2e", "#ce2b27", "#e8642a", "#de7942", "#98af72"];
    string[] c8 = ["#69baa6", "#f3f2c9", "#f1ca32", "#ed6244", "#f2278b"];
    string[] c9 = ["#dfae53", "#d9c373", "#684421", "#181b1b", "#240d0a"];
    string[] c10 = ["#343146", "#256774", "#2c8882", "#b2d9c2", "#fcf9d4"];
    string[] c11 = ["#163039", "#112941", "#698e82", "#eed687", "#f2e97f"];
    string[] c12 = ["#3e4e4d", "#4d9472", "#dfae3e", "#d9802f", "#ef7d33"];
    string[] c13 = ["#42909d", "#6ae4de", "#f8eac6", "#fb9084", "#da717a"];
    string[] c14 = ["#a21925", "#fbee90", "#a4c777", "#437839", "#112019"];
    string[] c15 = ["#3e2b30", "#6a4f67", "#b07c7f", "#e1b2ab", "#cb5d29"];
    string[] c16 = ["#253a40", "#988f81", "#fefefe", "#63482c", "#322013"];
    string[] c17 = ["#0d5558", "#4fb0a4", "#e0c182", "#a97374", "#e04a50"];
    string[] c18 = ["#d39237", "#b5ae5f", "#65aaad", "#1127e4", "#124a52"];
    string[] c19 = ["#dc393e", "#438082", "#49908b", "#6b8180", "#5eb4b8"];
    string[] c20 = ["#16393c", "#469b48", "#b0c84e", "#faf5cc", "#cd5f47"];
    string[] c21 = ["#fda98f", "#f3aa91", "#b4d5c8", "#3adfd5", "#16b39e"];
    string[] c22 = ["#322028", "#434344", "#806962", "#807f83", "#a2bac8"];
    string[] c23 = ["#cce68a", "#277465", "#218d6f", "#124146", "#102835"];
    string[] c24 = ["#0e0f12", "#4d3946", "#4e9585", "#066876", "#2c786b"];
    string[] c25 = ["#354d51", "#468485", "#93cde2", "#f7e9d3", "#fcf3da"];
    string[] c26 = ["#fe0750", "#82dbd7", "#9ecd42", "#24967b", "#12304c"];
    string[] c27 = ["#2a4158", "#2e6879", "#a08e6f", "#d8bc90", "#edf1b9"];
    string[] c28 = ["#3d2f37", "#6d6d7c", "#a9a18c", "#d7c2b5", "#f6f3ee"];
    string[] c29 = ["#b59078", "#93b0ae", "#8c95a4", "#628b8f", "#6d535a"];
    string[] c30 = ["#08123d", "#444d71", "#ccb9b8", "#61534c", "#33271a"];

    string[][] allColors = [
        c1,
        c2,
        c3,
        c4,
        c5,
        c6,
        c7,
        c8,
        c9,
        c10,
        c11,
        c12,
        c13,
        c14,
        c15,
        c16,
        c17,
        c18,
        c19,
        c20,
        c21,
        c22,
        c23,
        c24,
        c25,
        c26,
        c27,
        c28,
        c29,
        c30
    ];

    // function pickRandomBackgroundColor() public view returns (uint256) {
    //     uint256 randColor = random(
    //         string(
    //             abi.encodePacked(
    //                 Strings.toString(block.timestamp)
    //                 // Strings.toString(tokenId)
    //             )
    //         )
    //     );
    //     randColor = randColor % backgroundColorArr.length;
    //     return randColor;
    // }

    // uint256 backgroundColor = pickRandomBackgroundColor();

    // function pickRandomColorPalette() public view returns (uint256) {
    //     uint256 randPalette = random(
    //         string(abi.encodePacked(Strings.toString(block.timestamp)))
    //     );
    //     randPalette = randPalette % allColors.length;
    //     return randPalette;
    // }

    // uint256 colorPalette = pickRandomColorPalette();

    // function random(string memory input) internal pure returns (uint256) {
    //     return uint256(keccak256(abi.encodePacked(input)));
    // }

}
