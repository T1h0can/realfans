using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class realfansView extends Ui.WatchFace {
	var customChinese;
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        //setLayout(Rez.Layouts.WatchFace(dc));
        customChinese = Ui.loadResource(Rez.Fonts.customChinese);
    }

    // Update the view
    function onUpdate(dc) {
        // Get and show the current time
        var drawHa = new Rez.Drawables.zhangzhe();
        var clockTime = Sys.getClockTime();
        //var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var deviceSettings = Sys.getDeviceSettings();
        var hour = clockTime.hour;
        //var floors = new Rez.Drawables.icons();
        if (!deviceSettings.is24Hour){
        	if(hour > 12){
        		hour %= 12;
        	}
        }
        //var view = View.findDrawableById("TimeLabel");
        //view.setText(timeString);
		drawHa.draw(dc);
		dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
		dc.drawText(40, 75, Gfx.FONT_NUMBER_MEDIUM, Lang.format("$1$", [hour.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT);
		//dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		dc.drawText(145, 75, Gfx.FONT_NUMBER_MEDIUM, Lang.format("$1$", [clockTime.min.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(109, 20, customChinese, "EFDACB", Gfx.TEXT_JUSTIFY_CENTER);
        // Call the parent onUpdate function to redraw the layout
        //View.onUpdate(dc);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }
    
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
