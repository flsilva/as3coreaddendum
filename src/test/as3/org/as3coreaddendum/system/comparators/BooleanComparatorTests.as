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
	public class BooleanComparatorTests
	{
		
		public function BooleanComparatorTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="ArgumentError")]
		public function constructor_invalidArgument_ThrowsError(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(null);
			comparator = null;
		}
		
		///////////////////////////////////////////
		// AlphabeticComparator.comparison TESTS //
		///////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function comparison_invalidArgument_ThrowsError(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			comparator.comparison = null;
		}
		
		/////////////////////////////////////////////////////////////////////
		// BooleanComparator(BooleanComparison.TRUE_FIRST).compare() TESTS //
		/////////////////////////////////////////////////////////////////////
		
		[Test]
		public function compare_trueFirstComparison1_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			var result:int = comparator.compare(true, true);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_trueFirstComparison2_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			var result:int = comparator.compare(true, false);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_trueFirstComparison3_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			var result:int = comparator.compare(false, true);
			Assert.assertEquals(1, result);
		}
		
		//////////////////////////////////////////////
		// BooleanComparator(BooleanComparison.FALSE_FIRST).compare() TESTS //
		//////////////////////////////////////////////
		
		[Test]
		public function compare_falseFirstComparison1_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.FALSE_FIRST);
			var result:int = comparator.compare(false, false);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_falseFirstComparison2_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.FALSE_FIRST);
			var result:int = comparator.compare(true, false);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_falseFirstComparison3_ReturnsInteger(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.FALSE_FIRST);
			var result:int = comparator.compare(false, true);
			Assert.assertEquals(-1, result);
		}
		
		//////////////////////////////////////////
		// BooleanComparator().toString() TESTS //
		//////////////////////////////////////////
		
		[Test]
		public function toString_simpleCall1_ReturnsString(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.TRUE_FIRST);
			var result:String = comparator.toString();
			Assert.assertEquals("[BooleanComparator: comparison = True First]", result);
		}
		
		[Test]
		public function toString_simpleCall2_ReturnsString(): void
		{
			var comparator:BooleanComparator = new BooleanComparator(BooleanComparison.FALSE_FIRST);
			var result:String = comparator.toString();
			Assert.assertEquals("[BooleanComparator: comparison = False First]", result);
		}
		
	}

}