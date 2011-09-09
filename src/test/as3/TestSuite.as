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

package 
{
	import org.as3coreaddendum.errors.ErrorsTests;
	import org.as3coreaddendum.events.IndexEventTests;
	import org.as3coreaddendum.events.PriorityEventTests;
	import org.as3coreaddendum.system.EnumTests;
	import org.as3coreaddendum.system.ICloneableTests;
	import org.as3coreaddendum.system.NumericRoundingTests;
	import org.as3coreaddendum.system.comparators.AlphabeticalComparatorTests;
	import org.as3coreaddendum.system.comparators.BooleanComparatorTests;
	import org.as3coreaddendum.system.comparators.DateComparatorTests;
	import org.as3coreaddendum.system.comparators.IndexablePriorityComparatorTests;
	import org.as3coreaddendum.system.comparators.NumberComparatorTests;
	import org.as3coreaddendum.system.comparators.PriorityComparatorTests;
	import org.as3coreaddendum.system.comparators.PropertyComparatorTests;
	import org.as3coreaddendum.system.comparators.StringComparatorTests;

	/**
	 * @author Flávio Silva
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TestSuite
	{
		
		//org.as3coreaddendum.errors
		public var errors_t1:ErrorsTests;
		
		//org.as3coreaddendum.events
		public var indexEventTests:IndexEventTests;
		public var priorityEventTests:PriorityEventTests;
		
		//org.as3coreaddendum.system
		public var system_t1:EnumTests;
		public var system_t2:ICloneableTests;
		public var system_t3:NumericRoundingTests;
		
		//org.as3coreaddendum.system.comparators
		public var comparators_t1:AlphabeticalComparatorTests;
		public var comparators_t2:BooleanComparatorTests;
		public var comparators_t3:DateComparatorTests;
		public var comparators_t4:IndexablePriorityComparatorTests;
		public var comparators_t5:NumberComparatorTests;
		public var comparators_t6:PriorityComparatorTests;
		public var comparators_t7:PropertyComparatorTests;
		public var comparators_t8:StringComparatorTests;

		public function TestSuite()
		{
			
		}

	}

}