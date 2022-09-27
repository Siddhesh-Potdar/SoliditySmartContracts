pragma solidity  >=0.4.0;

contract Manufacturer{
    
    enum User{
        manufacturer,
        distributor,
        pharmacist,
        patient
    }   
    

   struct  manufacturer_detail{
        string name;
        uint manufacturer_id;
        string manufacturer_address;
    }

   struct  Distributor_detail{
        string name;
        uint Distributorr_id;
        string Distributorr_address;
    }

   struct  pharmacist_detail{
        string name;
        uint pharmacist_id;
        string pharmacist_address;
    }

   struct  patient_detail{
        string name;
        uint patient_id;
        string patient_address;
    }    
   

    mapping( address => User) public usertype;

    mapping (address => manufacturer_detail) public detail;

    mapping (address => Distributor_detail) public Distributordetail;
    
    mapping (address => pharmacist_detail) public pharmacistdetail;
   
    mapping (address => patient_detail) public patientdetail;

     

    
    mapping (address => mapping( uint => uint)) public stock; // stock of medical supplies
    
    mapping (address => mapping( uint => uint)) public MRP;  // MRP of medical supplies
    

    function mfilldetail(string memory _name, uint _id, string memory _address) public {
        usertype[msg.sender]= User.manufacturer;
        detail[msg.sender] = manufacturer_detail( _name, _id, _address) ;
    }

    function dfilldetail(string memory _name, uint _id, string memory _address) public {
        usertype[msg.sender]= User.distributor;
        Distributordetail[msg.sender] = Distributor_detail( _name, _id, _address) ;
    }

    function pfilldetail(string memory _name, uint _id, string memory _address) public {
        usertype[msg.sender]= User.pharmacist;
        pharmacistdetail[msg.sender] = pharmacist_detail( _name, _id, _address) ;
    }

    function ppfilldetail(string memory _name, uint _id, string memory _address) public {
        usertype[msg.sender]= User.patient;
        patientdetail[msg.sender] = patient_detail( _name, _id, _address) ;
    }


  
    function refill(uint _id,uint unit) public {
        require(usertype[msg.sender] == User.manufacturer, "Not Manufacturer");
        stock[msg.sender][_id] += unit;
    }
    
    function distributor_buying(address manufacturer,uint _id,uint unit) public {
        require(usertype[msg.sender] == User.distributor, "Not Distributor");
        require( stock[manufacturer][_id] >= unit, "Number of Units are not present");
        stock[manufacturer][_id] -= unit;
        stock[msg.sender][_id] += unit;

    }     
    function pharmacist_buying(address Distributorr,uint _id,uint unit) public {
        require(usertype[msg.sender] == User.pharmacist, "Not pharmacist");
        require( stock[Distributorr][_id] >= unit, "Number of Units are not present");
        stock[Distributorr][_id] -= unit;
        stock[msg.sender][_id] += unit;

    } 
   
    
    function pay_buying(address pharmacist,uint _id,uint unit) public {
        require(usertype[msg.sender] == User.manufacturer, "Not Manufacturer");
        require( stock[pharmacist][_id] >= unit, "Number of Units are not present");
        stock[pharmacist][_id] -= unit;
        stock[msg.sender][_id] += unit;


    }  
    
    function getmanufacturer_detail() public view returns (User){
        return User.patient;
    }
    
   
}
