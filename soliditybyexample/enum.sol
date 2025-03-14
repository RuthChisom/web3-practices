// Enums are useful to model choice and keep track of state
pragma solidity ^0.8.26;

contract Enum {
    // shipping status, default value will be the first element
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancelled
    } //this can be save in adifferent file and imported here

    Status public status;
    // returns uint (Pending-0, Shipped-1, Accepted-2, Rejected-3, Cancelled-4)
    function get() public view returns (Status) {
        return status;
    }

    // update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // update to a specific enum
    function cancel() public {
        status = Status.Cancelled;
    }

    function reset() public {
        delete status;
    }


}