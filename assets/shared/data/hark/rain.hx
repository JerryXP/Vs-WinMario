import shaders.RainShader;

var rainShader:RainShader;

function onCreatePost() {
    if (ClientPrefs.data.shaders) {
        rainShader = new RainShader();
        rainShader.scale = FlxG.height / 200;
        rainShader.intensity = 3;
        game.camGame.filters = [new ShaderFilter(rainShader)];
    }
}
function onUpdate(elapsed:Float) {
    if (rainShader != null) {
        rainShader.updateViewInfo(FlxG.width, FlxG.height, game.camGame);
        rainShader.update(elapsed);
    }
}