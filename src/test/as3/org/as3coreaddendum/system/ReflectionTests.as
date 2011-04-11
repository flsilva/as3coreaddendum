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
	import org.as3coreaddendum.system.comparators.BooleanComparator;
	import org.as3coreaddendum.system.comparators.DateComparator;
	import org.as3coreaddendum.system.comparators.PriorityComparator;
	import org.flexunit.Assert;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.engine.FontMetrics;

	/**
	 * @author Flávio Silva
	 */
	public class ReflectionTests
	{
		
		public function ReflectionTests()
		{
			
		}
		
		/////////////////////////////////////
		// Reflection.getClassName() TESTS //
		/////////////////////////////////////
		
		[Test]
		public function getClassName_validStringObject_ReturnsStringWithClassName(): void
		{
			var className:String = Reflection.getClassName("teste");
			Assert.assertEquals("String", className);
		}
		
		[Test]
		public function getClassName_validStringClass_ReturnsStringWithClassName(): void
		{
			var className:String = Reflection.getClassName(String);
			Assert.assertEquals("String", className);
		}
		
		[Test]
		public function getClassName_validDisplayObjectClass_ReturnsStringWithClassName(): void
		{
			var className:String = Reflection.getClassName(DisplayObject);
			Assert.assertEquals("DisplayObject", className);
		}
		
		[Test]
		public function getClassName_validSpriteObject_ReturnsStringWithClassName(): void
		{
			var className:String = Reflection.getClassName(new Sprite());
			Assert.assertEquals("Sprite", className);
		}
		
		[Test]
		public function getClassName_validBooleanComparatorObject_ReturnsStringWithClassName(): void
		{
			var className:String = Reflection.getClassName(new BooleanComparator());
			Assert.assertEquals("BooleanComparator", className);
		}
		
		////////////////////////////////////////
		// Reflection.getClassPackage() TESTS //
		////////////////////////////////////////
		
		[Test]
		public function getClassPackage_validSpriteClass_ReturnsStringWithClassPackage(): void
		{
			var className:String = Reflection.getClassPackage(Sprite);
			Assert.assertEquals("flash.display", className);
		}
		
		[Test]
		public function getClassPackage_validSpriteObject_ReturnsStringWithClassPackage(): void
		{
			var className:String = Reflection.getClassPackage(new Sprite());
			Assert.assertEquals("flash.display", className);
		}
		
		[Test]
		public function getClassPackage_validFontMetricsClass_ReturnsStringWithClassPackage(): void
		{
			var className:String = Reflection.getClassPackage(FontMetrics);
			Assert.assertEquals("flash.text.engine", className);
		}
		
		[Test]
		public function getClassPackage_validPriorityComparatorObject_ReturnsStringWithClassPackage(): void
		{
			var className:String = Reflection.getClassPackage(new PriorityComparator());
			Assert.assertEquals("org.as3coreaddendum.system.comparators", className);
		}
		
		[Test]
		public function getClassPackage_validNumberClass_ReturnsNull(): void
		{
			var className:String = Reflection.getClassPackage(Number);
			Assert.assertNull(className);
		}
		
		/////////////////////////////////////
		// Reflection.getClassPath() TESTS //
		/////////////////////////////////////
		
		[Test]
		public function getClassPath_validNumberObject_ReturnsStringWithClassPath(): void
		{
			var className:String = Reflection.getClassPath(123.4);
			Assert.assertEquals("Number", className);
		}
		
		[Test]
		public function getClassPath_validNumberClass_ReturnsStringWithClassPath(): void
		{
			var className:String = Reflection.getClassPath(Number);
			Assert.assertEquals("Number", className);
		}
		
		[Test]
		public function getClassPath_validDateComparatorObject_ReturnsStringWithClassPath(): void
		{
			var className:String = Reflection.getClassPath(new DateComparator());
			Assert.assertEquals("org.as3coreaddendum.system.comparators.DateComparator", className);
		}
		
		[Test]
		public function getClassPath_validDateComparatorClass_ReturnsStringWithClassPath(): void
		{
			var className:String = Reflection.getClassPath(DateComparator);
			Assert.assertEquals("org.as3coreaddendum.system.comparators.DateComparator", className);
		}
		
	}

}