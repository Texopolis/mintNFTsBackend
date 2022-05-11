

interface IdateTimeInterface {        /*
         *  interface for interfacing with the DateTime contract.
         *
         */
        function isLeapYear(uint16 year) view external returns (bool);
        function getYear(uint timestamp) view external returns (uint16);
        function getMonth(uint timestamp) view external returns (uint8);
        function getDay(uint timestamp) view external returns (uint8);
        function getHour(uint timestamp) view external returns (uint8);
        function getMinute(uint timestamp) view external returns (uint8);
        function getSecond(uint timestamp) view external returns (uint8);
        function getWeekday(uint timestamp) view external returns (uint8);
        function toTimestamp(uint16 year, uint8 month, uint8 day) view external returns (uint timestamp);
        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour) view external returns (uint timestamp);
        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute) view external returns (uint timestamp);
        function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute, uint8 second) view external returns (uint timestamp);
}
