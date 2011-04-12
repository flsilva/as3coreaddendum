/*
 * Licensed under the MIT License
 * 
 * Copyright 2010 (c) Flávio Silva, http://flsilva.com
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * http://www.opensource.org/licenses/mit-license.php
 */

package org.as3coreaddendum.system {
	import org.as3coreaddendum.errors.NullPointerError;
	import org.as3coreaddendum.system.comparators.BooleanComparator;
	import org.as3coreaddendum.system.comparators.DateComparator;
	import org.as3coreaddendum.system.comparators.PriorityComparator;
	import org.flexunit.Assert;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.net.FileReference;
	import flash.text.TextField;
	import flash.text.engine.FontMetrics;

	/**
	 * @author Flávio Silva
	 */
	public class ReflectionTests
	{
		
		public function ReflectionTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="flash.errors.IllegalOperationError")]
		public function constructor_illegalInstanciation_ThrowsError(): void
		{
			var reflection:Reflection = new Reflection();
			reflection = null;
		}
		
		/////////////////////////////////////
		// Reflection.getClassName() TESTS //
		/////////////////////////////////////
		
		[Test]
		public function getClassName_validStringObject_ReturnsStringWithClassName(): void
		{
			var result:String = Reflection.getClassName("teste");
			Assert.assertEquals("String", result);
		}
		
		[Test]
		public function getClassName_validStringClass_ReturnsStringWithClassName(): void
		{
			var result:String = Reflection.getClassName(String);
			Assert.assertEquals("String", result);
		}
		
		[Test]
		public function getClassName_validSpriteObject_ReturnsStringWithClassName(): void
		{
			var result:String = Reflection.getClassName(new Sprite());
			Assert.assertEquals("Sprite", result);
		}
		
		[Test]
		public function getClassName_validDisplayObjectClass_ReturnsStringWithClassName(): void
		{
			var result:String = Reflection.getClassName(DisplayObject);
			Assert.assertEquals("DisplayObject", result);
		}
		
		[Test]
		public function getClassName_validBooleanComparatorObject_ReturnsStringWithClassName(): void
		{
			var result:String = Reflection.getClassName(new BooleanComparator());
			Assert.assertEquals("BooleanComparator", result);
		}
		
		////////////////////////////////////////
		// Reflection.getClassPackage() TESTS //
		////////////////////////////////////////
		
		[Test]
		public function getClassPackage_validSpriteClass_ReturnsStringWithClassPackage(): void
		{
			var result:String = Reflection.getClassPackage(Sprite);
			Assert.assertEquals("flash.display", result);
		}
		
		[Test]
		public function getClassPackage_validSpriteObject_ReturnsStringWithClassPackage(): void
		{
			var result:String = Reflection.getClassPackage(new Sprite());
			Assert.assertEquals("flash.display", result);
		}
		
		[Test]
		public function getClassPackage_validFontMetricsClass_ReturnsStringWithClassPackage(): void
		{
			var result:String = Reflection.getClassPackage(FontMetrics);
			Assert.assertEquals("flash.text.engine", result);
		}
		
		[Test]
		public function getClassPackage_validPriorityComparatorObject_ReturnsStringWithClassPackage(): void
		{
			var result:String = Reflection.getClassPackage(new PriorityComparator());
			Assert.assertEquals("org.as3coreaddendum.system.comparators", result);
		}
		
		[Test]
		public function getClassPackage_validNumberClass_ReturnsNull(): void
		{
			var result:String = Reflection.getClassPackage(Number);
			Assert.assertNull(result);
		}
		
		/////////////////////////////////////
		// Reflection.getClassPath() TESTS //
		/////////////////////////////////////
		
		[Test]
		public function getClassPath_validNumberObject_ReturnsStringWithClassPath(): void
		{
			var result:String = Reflection.getClassPath(123.4);
			Assert.assertEquals("Number", result);
		}
		
		[Test]
		public function getClassPath_validNumberClass_ReturnsStringWithClassPath(): void
		{
			var result:String = Reflection.getClassPath(Number);
			Assert.assertEquals("Number", result);
		}
		
		[Test]
		public function getClassPath_validDateComparatorObject_ReturnsStringWithClassPath(): void
		{
			var result:String = Reflection.getClassPath(new DateComparator());
			Assert.assertEquals("org.as3coreaddendum.system.comparators.DateComparator", result);
		}
		
		[Test]
		public function getClassPath_validDateComparatorClass_ReturnsStringWithClassPath(): void
		{
			var result:String = Reflection.getClassPath(DateComparator);
			Assert.assertEquals("org.as3coreaddendum.system.comparators.DateComparator", result);
		}
		
		//////////////////////////////////////////
		// Reflection.getSuperClassName() TESTS //
		//////////////////////////////////////////
		
		[Test]
		public function getSuperClassName_validNumberObject_ReturnsStringWithSuperClassName(): void
		{
			var result:String = Reflection.getSuperClassName(123.4);
			Assert.assertEquals("Object", result);
		}
		
		[Test]
		public function getSuperClassName_validNumberClass_ReturnsStringWithSuperClassName(): void
		{
			var result:String = Reflection.getSuperClassName(Number);
			Assert.assertEquals("Object", result);
		}
		
		[Test]
		public function getSuperClassName_validSpriteObject_ReturnsStringWithSuperClassName(): void
		{
			var result:String = Reflection.getSuperClassName(new Sprite());
			Assert.assertEquals("DisplayObjectContainer", result);
		}
		
		[Test]
		public function getSuperClassName_validSpriteClass_ReturnsStringWithSuperClassName(): void
		{
			var result:String = Reflection.getSuperClassName(Sprite);
			Assert.assertEquals("DisplayObjectContainer", result);
		}
		
		[Test]
		public function getSuperClassName_validNullPointerErrorClass_ReturnsStringWithSuperClassName(): void
		{
			var result:String = Reflection.getSuperClassName(NullPointerError);
			Assert.assertEquals("Error", result);
		}
		
		/////////////////////////////////////////////
		// Reflection.getSuperClassPackage() TESTS //
		/////////////////////////////////////////////
		
		[Test]
		public function getSuperClassName_validArrayObject_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage([]);
			Assert.assertNull(result);
		}
		
		[Test]
		public function getSuperClassName_validArrayClass_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(Array);
			Assert.assertNull(result);
		}
		
		[Test]
		public function getSuperClassName_validDisplayObjectClass_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(DisplayObject);
			Assert.assertEquals("flash.events", result);
		}
		
		[Test]
		public function getSuperClassName_validFileReferenceObject_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(new FileReference());
			Assert.assertEquals("flash.events", result);
		}
		
		[Test]
		public function getSuperClassName_validFileReferenceClass_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(FileReference);
			Assert.assertEquals("flash.events", result);
		}
		
		[Test]
		public function getSuperClassName_validTextFieldObject_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(new TextField());
			Assert.assertEquals("flash.display", result);
		}
		
		[Test]
		public function getSuperClassName_validTextFieldClass_ReturnsStringWithSuperClassPackage(): void
		{
			var result:String = Reflection.getSuperClassPackage(TextField);
			Assert.assertEquals("flash.display", result);
		}
		
		/////////////////////////////////////////////
		// Reflection.getSuperClassPackage() TESTS //
		/////////////////////////////////////////////
		
		[Test]
		public function getSuperClassPath_validBooleanObject_ReturnsStringWithSuperClassPath(): void
		{
			var result:String = Reflection.getSuperClassPath(true);
			Assert.assertEquals("Object", result);
		}
		
		[Test]
		public function getSuperClassPath_validBooleanClass_ReturnsStringWithSuperClassPath(): void
		{
			var result:String = Reflection.getSuperClassPath(Boolean);
			Assert.assertEquals("Object", result);
		}
		
		[Test]
		public function getSuperClassPath_validTextFieldObject_ReturnsStringWithSuperClassPath(): void
		{
			var result:String = Reflection.getSuperClassPath(new TextField());
			Assert.assertEquals("flash.display.InteractiveObject", result);
		}
		
		[Test]
		public function getSuperClassPath_validTextFieldClass_ReturnsStringWithSuperClassPath(): void
		{
			var result:String = Reflection.getSuperClassPath(TextField);
			Assert.assertEquals("flash.display.InteractiveObject", result);
		}
		
	}

}