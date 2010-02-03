package com.snowycode.formidable.handlers
{

	public class ListBasedFieldHandler extends FieldHandler
	{

		public var comparisonProperty:String;
		public var dataProviderProperty:String = "dataProvider";

		public function ListBasedFieldHandler()
		{
			super();
			super.fieldProperty = "selectedItem";
		}

		override public function setValue(value:Object):void
		{
			if (comparisonProperty != null && dataProviderProperty != null)
			{

				for each (var obj:Object in field[dataProviderProperty])
				{
					if (obj[comparisonProperty] == value[comparisonProperty])
					{
						super.setValue(obj);
						return;
					}
				}

			}
			else
			{
				super.setValue(value);
			}
		}

	}
}