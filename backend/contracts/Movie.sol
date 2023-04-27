// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Movie {

    mapping(uint => movieDeatilsRequest) public moviesRequest;
    mapping(address => movieDeatilsRequest[]) public moviesFundedAndBought;
    uint256 numberMovieDetails;
    uint256 numberMovieFundedBought;

    function saveMovieDetailsRequest(string memory movieName, string memory directorName,
                                    string memory description, uint256 fundNeeded) external {

        moviesRequest[numberMovieDetails].movieName = movieName;
        moviesRequest[numberMovieDetails].directorName = directorName;
        moviesRequest[numberMovieDetails].description = description;
        moviesRequest[numberMovieDetails].fundNeeded = fundNeeded;

        numberMovieDetails = numberMovieDetails + 1;
    }

    function fundOrBuyMovie(uint256 index) external {
        moviesFundedAndBought[numberMovieFundedBought].movieName = moviesRequest[index].movieName;
        moviesFundedAndBought[numberMovieFundedBought].directorName = moviesRequest[index].directorName;
        moviesFundedAndBought[numberMovieFundedBought].description = moviesRequest[index].description;
        moviesFundedAndBought[numberMovieFundedBought].fundNeeded = moviesRequest[index].fundNeeded;

        numberMovieFundedBought = numberMovieFundedBought + 1;
    }
    
    struct movieDeatilsRequest{
        string movieName;
        string directorName;
        string description;
        uint256 fundNeeded;
    }
}
