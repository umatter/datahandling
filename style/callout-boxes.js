// JavaScript to classify callout blockquotes for GitBook HTML output
// This script adds CSS classes to blockquotes based on their content
// (In Practice: -> .inpractice, Common Error: -> .commonerror)

(function() {
  'use strict';

  function classifyCalloutBoxes() {
    // Find all blockquotes in the page
    var blockquotes = document.querySelectorAll('.book-body blockquote');

    blockquotes.forEach(function(bq) {
      // Get the first paragraph
      var firstPara = bq.querySelector('p:first-child');
      if (!firstPara) return;

      // Get the first strong element
      var firstStrong = firstPara.querySelector('strong:first-child');
      if (!firstStrong) return;

      var text = firstStrong.textContent.trim();

      // Classify based on content
      if (text.indexOf('In Practice:') === 0) {
        bq.classList.add('inpractice');
      } else if (text.indexOf('Common Error:') === 0) {
        bq.classList.add('commonerror');
      }
    });
  }

  // Run on DOM ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', classifyCalloutBoxes);
  } else {
    classifyCalloutBoxes();
  }

  // Also run when gitbook page changes (for single-page app navigation)
  if (typeof gitbook !== 'undefined') {
    gitbook.events.bind('page.change', classifyCalloutBoxes);
  }
})();
