pragma solidity^0.6.3;

contract Assignment {
    
      struct Movies{
        uint MovieId;
        string MovieName;
        string Genre;
        string Distributor;
        uint BoxOfficeActuals;
        uint FantasyPoints;
        uint WeeksinRelease;
        uint EstimatedScreenRelease;
        string ReleaseType;
        uint[] ActorsFK;
        
    }
   
    
    Movies[] public movies;
    
    uint public movieid;
    
    /**
     * @dev Add Movies on the Actor List
     */
    
    function createMovies(uint MovieId,string memory MovieName,string memory Genre,string memory Distributor,uint BoxOfficeActuals,uint FantasyPoints,uint WeeksinRelease,uint EstimatedScreenRelease,string memory ReleaseType,uint[] memory _ActorsFK) public {
        movies.push(Movies(MovieId,MovieName,Genre,Distributor,BoxOfficeActuals,FantasyPoints,WeeksinRelease,EstimatedScreenRelease,ReleaseType,_ActorsFK));
        movieid++;
        
    }
    
    
    /**
     * @dev Updates the Movie List
     */
    
    function updateMovie(uint _MovieId,string memory _MovieName,string memory _Genre,string memory _Distributor,uint _BoxOfficeActuals,uint _FantasyPoints,uint _WeeksinRelease,uint _EstimatedScreenRelease,string memory _ReleaseType ) public{
        uint i = findMovies(_MovieId);
        movies[i].MovieName = _MovieName;
        movies[i].MovieId = _MovieId;
        movies[i].Genre = _Genre;
        movies[i].Distributor = _Distributor;
        movies[i].BoxOfficeActuals = _BoxOfficeActuals;
        movies[i].FantasyPoints = _FantasyPoints;
        movies[i].WeeksinRelease = _WeeksinRelease;
        movies[i].EstimatedScreenRelease = _EstimatedScreenRelease;
        movies[i].ReleaseType = _ReleaseType;
        
        
    }
    
    
    
     /**
     * @dev Fetch Movie Details
     */
    
    function getMovies(uint _MovieId) public view returns (uint,string memory,string memory,string memory,uint,uint,uint,uint,string memory){
        uint i = findMovies(_MovieId);
        return (
            movies[i].MovieId,
            movies[i].MovieName,
            movies[i].Genre,
            movies[i].Distributor,
            movies[i].BoxOfficeActuals,
            movies[i].FantasyPoints,
            movies[i].WeeksinRelease,
            movies[i].EstimatedScreenRelease,
            movies[i].ReleaseType
            );
    }
    
    
    /**
     * @dev Delete Movies from the Movie List
     */
     
    function deleteMovies(uint _MovieId) public {
        uint i = _MovieId;
        delete movies[i];
    }
    
    function findMovies(uint _MovieId) internal view returns(uint) {
        for(uint i=0;i<movies.length;i++) {
            if(movies[i].MovieId == _MovieId){
                return i;
            }
        }
    }
    
    
    struct Actors{
        
        uint selectionpoint;
        string ActorName;
        uint ActorId;
        uint Points;
        uint Salary;
        
        
        
    }
    mapping(uint=>uint) public movieIdandassociatedsalary;
    
 
    uint public actorid;
    Actors[] public actors;
    
    /**
     * @dev Create Actors List
     */
     
    function createActors(uint _AssociatedSalary,uint _selectionpoint,string memory _ActorName,uint _ActorId,uint _Points,uint _Salary) public {
        movieIdandassociatedsalary[movieid] = _AssociatedSalary;
        actors.push(Actors(_selectionpoint,_ActorName,_ActorId,_Points,_Salary));
        actorid++;
    }
    
    /**
     * @dev Updates Actors List
     */
    
    function updateActors(uint _AssociatedSalary,uint _selectionpoint,string memory _ActorName,uint _ActorId,uint _Points,uint _Salary) public{
        uint j = findActors(_ActorId);
        movieIdandassociatedsalary[movieid] = _AssociatedSalary; 
        actors[j].selectionpoint = _selectionpoint;
        actors[j].ActorName = _ActorName;
        actors[j].ActorId = _ActorId;
        actors[j].Points = _Points;
        actors[j].Salary = _Salary;

    }
    
     /**
     * @dev Fetch details from Actor List
     */
    
    function getActors(uint _ActorId) public view returns(uint,string memory,uint,uint,uint){
        uint j = findActors(_ActorId);
        return (
            actors[j].selectionpoint,
            actors[j].ActorName,
            actors[j].ActorId,
            actors[j].Points,
            actors[j].Salary
            );
    }
    
     /**
      * @dev Delete Actors from List
      */
      
     function deleteActors(uint _ActorId) public {
        uint j = _ActorId;
        delete actors[j];
    }
    
    function findActors(uint _ActorId) internal view returns(uint) {
        for(uint j=0;j<movies.length;j++){
            if(actors[j].ActorId == _ActorId) {
                return j;
            }
        }
    }  
    
    
}
