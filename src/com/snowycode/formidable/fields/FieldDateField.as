package com.snowycode.formidable.fields
{
	import com.snowycode.formidable.interfaces.IFormField;
	import mx.controls.DateField;

	public class FieldDateField extends DateField implements IFormField
	{
		public function FieldDateField()
		{
			super();
		}

		public function clear():void
		{
			this.selectedDate = null;
		}

		public function getValue():Object
		{
			return this.selectedDate;
		}

		public function setValue(value:Object):void
		{
			this.selectedDate = value as Date;
		}

	}
}