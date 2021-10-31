using Toybox.Activity;
using Toybox.Lang;

module TDFBase {
module Computer{

class ComputerBase {
	protected var smallFieldBigFont as Lang.Boolean = false;
	public function getSmallFieldBigFont() as Lang.Boolean { return smallFieldBigFont; }

	protected var valueStr as Lang.String = "";
	public function getValueStr() as Lang.String { return valueStr; }

	protected var needUpdate as Lang.Boolean = true;
	protected var needUpdateUnitText as Lang.Boolean = true;
	public function getNeedUpdateUnitText() as Lang.Boolean {
		var tmp = needUpdateUnitText;
		needUpdateUnitText = false;
		return tmp;
	}
	protected var needUpdatePrefixText as Lang.Boolean = true;
	public function getNeedUpdatePrefixText() as Lang.Boolean {
		var tmp = needUpdatePrefixText;
		needUpdatePrefixText = false;
		return tmp;
	}

	protected var unit0Str as Lang.String = "";
	public function getUnit0Str() as Lang.String { return unit0Str; }
	protected var unit1Str as Lang.String = "";
	public function getUnit1Str() as Lang.String { return unit1Str; }
	protected var unit2Str as Lang.String = "";
	public function getUnit2Str() as Lang.String { return unit2Str; }
	protected var prefixStr as Lang.String = "";
	public function getPrefixStr() as Lang.String { return prefixStr; }

	public function computeMaxValueStr(longField as Lang.Boolean) as Lang.String { return ""; }

	public function compute(info as Activity.Info) as Void {}

	public function onLayout() as Void {}

	public function onUpdate(longField as Lang.Boolean) as Void {
		if(needUpdate)
		{
			update(longField);
			needUpdate = false;
		}
	}

	protected function update(longField as Lang.Boolean) as Void {}
}

}}