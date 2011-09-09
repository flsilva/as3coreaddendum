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

package org.as3coreaddendum.events 
{
	import org.flexunit.Assert;

	import flash.events.Event;

	/**
	 * @author Flávio Silva
	 */
	public class IndexEventTests
	{
		
		public function IndexEventTests()
		{
			
		}
		
		[Test]
		public function index_simpleCall_ReturnsCorrectIndex(): void
		{
			var event:IndexEvent = new IndexEvent(IndexEvent.CHANGED, -3);
			Assert.assertEquals(-3, event.index);
		}
		
		[Test]
		public function clone_simpleCall_ReturnsValidObject(): void
		{
			var event:IndexEvent = new IndexEvent(IndexEvent.CHANGED, -3);
			
			var clonedEvent:Event = event.clone();
			Assert.assertNotNull(clonedEvent);
		}
		
		[Test]
		public function clone_simpleCall_checkIfIndexMatches_ReturnsTrue(): void
		{
			var event:IndexEvent = new IndexEvent(IndexEvent.CHANGED, -3);
			var clonedEvent:Event = event.clone();
			
			var index:int = (clonedEvent as IndexEvent).index;
			Assert.assertNotNull(-3, index);
		}
		
	}

}