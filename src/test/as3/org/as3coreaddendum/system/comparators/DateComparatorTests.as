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
	public class DateComparatorTests
	{
		
		public function DateComparatorTests()
		{
			
		}
		
		//////////////////////////////////////////
		// DateComparator(true).compare() TESTS //
		//////////////////////////////////////////
		
		[Test]
		public function compare_dateComparison1_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 9);
			var d2:Date = new Date(2010, 4, 9);
			var result:int = comparator.compare(d1, d2);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_dateComparison2_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 9);
			var d2:Date = new Date(2010, 4, 10);
			var result:int = comparator.compare(d1, d2);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_dateComparison3_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 9);
			var d2:Date = new Date(2010, 4, 10);
			var result:int = comparator.compare(d2, d1);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_dateComparison4_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 10);
			var d2:Date = new Date(2009, 4, 10);
			var result:int = comparator.compare(d1, d2);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_dateComparison5_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 10);
			var d2:Date = new Date(2009, 12, 25);
			var result:int = comparator.compare(d2, d1);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_dateComparison6_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 9);
			var d2:Date = new Date(1980, 1, 15);
			var result:int = comparator.compare(d1, d2);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_dateComparison7_ReturnsInteger(): void
		{
			var comparator:DateComparator = new DateComparator();
			var d1:Date = new Date(2010, 4, 9);
			var d2:Date = new Date(1980, 1, 15);
			var result:int = comparator.compare(d2, d1);
			Assert.assertEquals(-1, result);
		}
		
	}

}