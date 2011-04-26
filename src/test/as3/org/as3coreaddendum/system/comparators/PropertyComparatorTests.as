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

package org.as3coreaddendum.system.comparators {
	import org.as3coreaddendum.system.IComparator;
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class PropertyComparatorTests
	{
		
		public function PropertyComparatorTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidInstantiationTest1_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", null);
			comparator = null;
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidInstantiationTest2_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator(null, new NumberComparator());
			comparator = null;
		}
		
		//////////////////////////////////////////
		// PropertyComparator().compare() TESTS //
		//////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest1_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.compare({}, null);
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest2_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.compare(null, {});
		}
		
		[Test]
		public function compare_validComparison1_ReturnsInteger(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			var t1:Object = { id: 1 };
			var t2:Object = { id: 1 };
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_validComparison2_ReturnsInteger(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			var t1:Object = { id: 1 };
			var t2:Object = { id: 2 };
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(-1, result);
		}
		
		/////////////////////////////////////////
		// PropertyComparator().property TESTS //
		/////////////////////////////////////////
		
		[Test]
		public function property_validInput_ReturnsString(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.property = "abc";
			var result:String = comparator.property;
			Assert.assertEquals("abc", result);
		}
		
		[Test(expects="ArgumentError")]
		public function property_invalidInput1_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.property = "";
		}
		
		[Test(expects="ArgumentError")]
		public function property_invalidInput2_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.property = null;
		}
		
		///////////////////////////////////////////
		// PropertyComparator().comparator TESTS //
		///////////////////////////////////////////
		
		[Test]
		public function comparator_validInput_ReturnsString(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			var propertyComparator:IComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			comparator.comparator = propertyComparator;
			var result:IComparator = comparator.comparator;
			Assert.assertEquals(propertyComparator, result);
		}
		
		[Test(expects="ArgumentError")]
		public function comparator_invalidInput_ThrowsError(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			comparator.comparator = null;
		}
		
		///////////////////////////////////////////
		// PropertyComparator().toString() TESTS //
		///////////////////////////////////////////
		
		[Test]
		public function toString_simpleCall1_ReturnsString(): void
		{
			var comparator:PropertyComparator = new PropertyComparator("id", new NumberComparator());
			var result:String = comparator.toString();
			Assert.assertEquals("[PropertyComparator: property = id]", result);
		}
		
	}

}