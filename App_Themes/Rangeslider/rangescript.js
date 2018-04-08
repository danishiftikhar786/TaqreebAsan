function (global) {
    var sliderValueHolders;
 
    var demo = global.demo = {
        sliderValueChange1: function (slider, args) {
            setValue(slider, getValueHolders()[0]);
        },
        sliderValueChange2: function (slider, args) {
            setValue(slider, getValueHolders()[1]);
        }
    }
 
    function getValueHolders() {
        if (!sliderValueHolders) {
            sliderValueHolders = $telerik.$.makeArray($telerik.$(".sliderValue"));
        }
        return sliderValueHolders;
    }
 
    function setValue(slider, valueHolder) {
        valueHolder.innerHTML = slider.get_value();
    }
     
})(window);