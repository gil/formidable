package com.mochadev.formidable.handlers
{
	import mx.core.UIComponent;
	import mx.validators.Validator;

	public class FieldHandler
	{

		public var field:UIComponent;
		public var fieldProperty:String = "text";

		public var providerProperty:String;

		public var validator:Validator;

		public function clear():void
		{
			if (field[fieldProperty] is String)
			{
				field[fieldProperty] = "";
			}
			else if (field[fieldProperty] is Number || field[fieldProperty] is int)
			{
				field[fieldProperty] = -1;
			}
			else
			{
				field[fieldProperty] = null;
			}
		}

		public function getValue():Object
		{
			return field[fieldProperty];
		}

		public function setValue(value:Object):void
		{
			field[fieldProperty] = value;
		}

	}
}