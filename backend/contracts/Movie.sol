// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Movie {

    mapping(uint => movieDeatilsRequest) public moviesRequest;
    mapping(address => movieDeatilsRequest[]) public moviesFundedAndBought;
    uint256 numberMovieDetails;

    function saveMovieDetailsRequest(string memory movieName, string memory directorName,
                                    string memory description, uint256 fundNeeded) external {

        moviesRequest[numberMovieDetails].movieName = movieName;
        moviesRequest[numberMovieDetails].directorName = directorName;
        moviesRequest[numberMovieDetails].description = description;
        moviesRequest[numberMovieDetails].fundNeeded = fundNeeded;

        numberMovieDetails = numberMovieDetails + 1;
    }

    function fundOrBuyMovie(uint256 index) external {
        movieDeatilsRequest memory temp = movieDeatilsRequest(moviesRequest[index].movieName,
        moviesRequest[index].directorName,moviesRequest[index].description,moviesRequest[index].fundNeeded);
        moviesFundedAndBought[msg.sender].push(temp);
    }
    
    struct movieDeatilsRequest{
        string movieName;
        string directorName;
        string description;
        uint256 fundNeeded;
    }
}
