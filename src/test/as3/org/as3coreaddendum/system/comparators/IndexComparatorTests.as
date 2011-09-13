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

package org.as3coreaddendum.system.comparators 
{
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class IndexComparatorTests
	{
		
		public function IndexComparatorTests()
		{
			
		}
		
		//////////////////////////////////////////
		// IndexComparator().compare() TESTS //
		//////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest1_ThrowsError(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t1:TestIndex = new TestIndex("t1", 1);
			comparator.compare(t1, {});
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest2_ThrowsError(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t1:TestIndex = new TestIndex("t1", 1);
			comparator.compare({}, t1);
		}
		
		[Test]
		public function compare_indexComparison1_ReturnsInteger(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t1:TestIndex = new TestIndex("t1", 1);
			var t2:TestIndex = new TestIndex("t2", 1);
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_indexComparison2_ReturnsInteger(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t0:TestIndex = new TestIndex("t0", 0);
			var t1:TestIndex = new TestIndex("t1", 1);
			var result:int = comparator.compare(t0, t1);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_indexComparison3_ReturnsInteger(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t0:TestIndex = new TestIndex("t0", 1);
			var t1:TestIndex = new TestIndex("t1", 0);
			var result:int = comparator.compare(t0, t1);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_indexComparison4_ReturnsInteger(): void
		{
			var comparator:IndexComparator = new IndexComparator();
			var t0:TestIndex = new TestIndex("t0", -1);
			var t1:TestIndex = new TestIndex("t1", 0);
			var result:int = comparator.compare(t0, t1);
			Assert.assertEquals(-1, result);
		}
		
	}
}

import org.as3coreaddendum.system.IIndexable;

class TestIndex implements IIndexable
{
	private var _name:String;
	private var _index:int;
	
	public function get index(): int { return _index; }
	
	public function set index(value:int): void { _index = value; }
	
	public function TestIndex(name:String, index:int)
	{
		_name = name;
		_index = index;
	}
	
	public function toString(): String
	{
		return "[TestIndex " + _name + "]";
	}
}