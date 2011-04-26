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
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class NumberComparatorTests
	{
		
		public function NumberComparatorTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="ArgumentError")]
		public function constructor_invalidArgument_ThrowsError(): void
		{
			var comparator:NumberComparator = new NumberComparator(false, 1);
			comparator = null;
		}
		
		////////////////////////////////////////
		// NumberComparator().compare() TESTS //
		////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest1_ThrowsError(): void
		{
			var comparator:NumberComparator = new NumberComparator();
			comparator.compare("1", 0);
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest2_ThrowsError(): void
		{
			var comparator:NumberComparator = new NumberComparator();
			comparator.compare(0, "0");
		}
		
		[Test(expects="RangeError")]
		public function compare_invalidArgumentTest4_ThrowsError(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, -1);
			comparator = null;
		}
		
		[Test(expects="RangeError")]
		public function compare_invalidArgumentTest5_ThrowsError(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 21);
			comparator = null;
		}
		
		////////////////////////////////////////////
		// NumberComparator(false).compare() TESTS //
		////////////////////////////////////////////
		
		[Test]
		public function compare_noDecimalPlacesComparison1_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(0, 0);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_noDecimalPlacesComparison2_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(-1, -1);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_noDecimalPlacesComparison3_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(5.4, 5.4);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_noDecimalPlacesComparison4_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(5.45, 5.4);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_noDecimalPlacesComparison5_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(-956.53684, -956.53684);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_noDecimalPlacesComparison6_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:int = comparator.compare(-956.53683, -956.53684);
			Assert.assertEquals(1, result);
		}
		
		///////////////////////////////////////////////
		// NumberComparator(true, 4).compare() TESTS //
		///////////////////////////////////////////////
		
		[Test]
		public function compare_decimalPlacesComparison1_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 4);
			var result:int = comparator.compare(-956.53683, -956.53684);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_decimalPlacesComparison2_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 4);
			var result:int = comparator.compare(-956.53683, -956.53686);
			Assert.assertEquals(1, result);
		}
		
		///////////////////////////////////////////////
		// NumberComparator(true, 5).compare() TESTS //
		///////////////////////////////////////////////
		
		[Test]
		public function compare_decimalPlacesComparison3_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 5);
			var result:int = comparator.compare(-956.53683, -956.53684);
			Assert.assertEquals(1, result);
		}
		
		///////////////////////////////////////////////
		// NumberComparator(true, 1).compare() TESTS //
		///////////////////////////////////////////////
		
		[Test]
		public function compare_decimalPlacesComparison4_ReturnsInteger(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 1);
			var result:int = comparator.compare(2.54, 2.56);
			Assert.assertEquals(-1, result);
		}
		
		/////////////////////////////////////////
		// NumberComparator().toString() TESTS //
		/////////////////////////////////////////
		
		[Test]
		public function toString_simpleCall1_ReturnsString(): void
		{
			var comparator:NumberComparator = new NumberComparator(true, 20);
			var result:String = comparator.toString();
			Assert.assertEquals("[NumberComparator: useDecimalPlaces = true | decimalPlaces = 20]", result);
		}
		
		[Test]
		public function toString_simpleCall2_ReturnsString(): void
		{
			var comparator:NumberComparator = new NumberComparator(false);
			var result:String = comparator.toString();
			Assert.assertEquals("[NumberComparator: useDecimalPlaces = false | decimalPlaces = 0]", result);
		}
		
	}

}