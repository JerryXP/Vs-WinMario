package states.errorDesktops;

#if (html5 || web)
import flixel.ui.FlxButton;
import flixel.FlxState;
import lime.app.Application;
import flixel.FlxG;

class OhNoHTML5 extends FlxState {
    override public function create():Void {
        FlxG.mouse.visible = false;
        super.create();

        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/empty.png");
        add(bg);

        var message:FlxSprite = new FlxSprite(0, 0);
        message.loadGraphic("assets/shared/images/html5.png");
        message.screenCenter();
        add(message);
    }
}
#end