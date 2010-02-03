package com.snowycode.formidable
{
	import com.snowycode.formidable.handlers.FieldHandler;
	import mx.validators.Validator;

	public class FormController
	{

		public var formFields:Array;

		public var provider:Object;

		public function populateFields():void
		{
			for each (var fieldHandler:FieldHandler in formFields)
			{
				var providerProperties:Array = fieldHandler.providerProperty.split(".");
				var property:Object = provider;

				for each (var providerProperty:String in providerProperties)
				{
					property = property[providerProperty];
				}

				fieldHandler.setValue(property);
			}
		}

		public function populateProvider():void
		{
			for each (var fieldHandler:FieldHandler in formFields)
			{
				var providerProperties:Array = fieldHandler.providerProperty.split(".");
				var property:Object = provider;

				for (var i:int = 0; i < providerProperties.length - 1; i++)
				{
					property = property[providerProperties[i]];
				}

				property[providerProperties[providerProperties.length - 1]] = fieldHandler.getValue();
			}
		}

		public function validateField(fieldHandler:FieldHandler):Boolean
		{
			if (fieldHandler.validator != null)
			{
				fieldHandler.validator.source = fieldHandler.field;
				return (Validator.validateAll([fieldHandler.validator]).length == 0)
			}

			return true;
		}

		public function validateFields():Boolean
		{
			var valid:Boolean = true;

			for each (var fieldHandler:FieldHandler in formFields)
			{
				if (!validateField(fieldHandler))
				{
					valid = false;
				}
			}

			return valid;
		}

		public function clearFields():void
		{
			for each (var fieldHandler:FieldHandler in formFields)
			{
				fieldHandler.clear();
			}
		}

	}
}