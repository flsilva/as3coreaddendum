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
	public class IndexablePriorityComparatorTests
	{
		
		public function IndexablePriorityComparatorTests()
		{
			
		}
		
		///////////////////////////////////////////////////
		// IndexablePriorityComparator().compare() TESTS //
		///////////////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest1_ThrowsError(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 1, 1);
			comparator.compare(t1, {});
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgumentTest2_ThrowsError(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 1, 1);
			comparator.compare({}, t1);
		}
		
		[Test]
		public function compare_indexablePriorityComparison1_ReturnsInteger(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 1, 1);
			var t2:TestIndexablePriority = new TestIndexablePriority("t2", 1, 1);
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_indexablePriorityComparison2_ReturnsInteger(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 1, 1);
			var t2:TestIndexablePriority = new TestIndexablePriority("t2", 2, 1);
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_indexablePriorityComparison3_ReturnsInteger(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 2, 1);
			var t2:TestIndexablePriority = new TestIndexablePriority("t2", 1, 1);
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_indexablePriorityComparison4_ReturnsInteger(): void
		{
			var comparator:IndexablePriorityComparator = new IndexablePriorityComparator();
			var t1:TestIndexablePriority = new TestIndexablePriority("t1", 1, 1);
			var t2:TestIndexablePriority = new TestIndexablePriority("t2", 1, 2);
			var result:int = comparator.compare(t1, t2);
			Assert.assertEquals(-1, result);
		}
		
	}
}

import org.as3coreaddendum.system.IIndexable;
import org.as3coreaddendum.system.IPriority;

class TestIndexablePriority implements IIndexable, IPriority
{
	private var _index:int;
	private var _name:String;
	private var _priority:int;
	
	public function get priority(): int { return _priority; }
	
	public function set priority(value:int): void { _priority = value; }
	
	public function get index(): int { return _index; }
	
	public function set index(value:int): void { _index = value; }
	
	public function TestIndexablePriority(name:String, priority:int, index:int)
	{
		_name = name;
		_priority = priority;
		_index = index;
	}
	
}