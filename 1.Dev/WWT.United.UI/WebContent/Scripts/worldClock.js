var United = United || {};

United.WorldClock = {};

/*
NOTE: The following properties must be set.

United.WorldClock.SecondsInCurrentMinute
*/
(function($) {
    United.WorldClock.UpdateAll = function() {
        $(".worldClockTime").each(function() {
            United.WorldClock.Update(this);
        });
    };

    United.WorldClock.Update = function(worldClockTimeElm) {
        var time = new Date(Date.parse("1/1/2000 " + worldClockTimeElm.innerHTML));

        time.setMinutes(time.getMinutes() + 1);

        var hours = time.getHours();
        var minutes = time.getMinutes();

        worldClockTimeElm.innerHTML = (hours === 0 ? 12 : (hours > 12 ? (hours - 12).toString() : hours.toString())) + ":" + (minutes < 10 ? "0" : "") + minutes.toString() + " " + (hours < 12 ? "AM" : "PM");
    };

    $(document).ready(function() {
        setTimeout(function() {
            United.WorldClock.UpdateAll();

            setInterval(function() {
                United.WorldClock.UpdateAll();
            }, (60000));
        }, (60 - United.WorldClock.SecondsInCurrentMinute) * 1000);
    });
})(jQuery);