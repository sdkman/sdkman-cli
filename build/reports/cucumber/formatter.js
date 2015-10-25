var CucumberHTML = {};

CucumberHTML.DOMFormatter = function(rootNode) {
  var currentUri;
  var currentFeature;
  var currentElement;
  var currentSteps;

  var currentStepIndex;
  var currentStep;
  var $templates = $(CucumberHTML.templates);

  this.uri = function(uri) {
    currentUri = uri;
  };

  this.feature = function(feature) {
    currentFeature = blockElement(rootNode, feature, 'feature');
  };

  this.background = function(background) {
    currentElement = featureElement(background, 'background');
    currentStepIndex = 1;
  };

  this.scenario = function(scenario) {
    currentElement = featureElement(scenario, 'scenario');
    currentStepIndex = 1;
  };

  this.scenarioOutline = function(scenarioOutline) {
    currentElement = featureElement(scenarioOutline, 'scenario_outline');
    currentStepIndex = 1;
  };

  this.step = function(step) {
    var stepElement = $('.step', $templates).clone();
    stepElement.appendTo(currentSteps);
    populate(stepElement, step, 'step');

    if (step.doc_string) {
      docString = $('.doc_string', $templates).clone();
      docString.appendTo(stepElement);
      // TODO: use a syntax highlighter based on the content_type
      docString.text(step.doc_string.value);
    }
    if (step.rows) {
      dataTable = $('.data_table', $templates).clone();
      dataTable.appendTo(stepElement);
      var tBody = dataTable.find('tbody');
      $.each(step.rows, function(index, row) {
        var tr = $('<tr></tr>').appendTo(tBody);
        $.each(row.cells, function(index, cell) {
          var td = $('<td>' + cell + '</td>').appendTo(tBody);
        });
      });
    }
  };

  this.examples = function(examples) {
    var examplesElement = blockElement(currentElement.children('details'), examples, 'examples');
    var examplesTable = $('.examples_table', $templates).clone();
    examplesTable.appendTo(examplesElement.children('details'));

    $.each(examples.rows, function(index, row) {
      var parent = index == 0 ? examplesTable.find('thead') : examplesTable.find('tbody');
      var tr = $('<tr></tr>').appendTo(parent);
      $.each(row.cells, function(index, cell) {
        var td = $('<td>' + cell + '</td>').appendTo(tr);
      });
    });
  };

  this.match = function(match) {
    currentStep = currentSteps.find('li:nth-child(' + currentStepIndex + ')');
    currentStepIndex++;
  };

  this.result = function(result) {
    currentStep.addClass(result.status);
    if (result.status == 'failed') {
      populateStepError(currentStep, result.error_message);
    }
    currentElement.addClass(result.status);
    var isLastStep = currentSteps.find('li:nth-child(' + currentStepIndex + ')').length == 0;
    if (isLastStep) {
      if (currentSteps.find('.failed').length == 0) {
        // No failed steps. Collapse it.
        currentElement.find('details').removeAttr('open');
      } else {
        currentElement.find('details').attr('open', 'open');
      }
    }
  };

  this.embedding = function(mimeType, data) {
    if (mimeType.match(/^image\//)) 
    {
      currentStep.append('<img src="' + data + '">');
    }
    else if (mimeType.match(/^video\//)) 
    {
      currentStep.append('<video src="' + data + '" type="' + mimeType + '" autobuffer controls>Your browser doesn\'t support video.</video>');
    }
    else if (mimeType.match(/^text\//)) 
    {
      this.write(data);
    }
  };

  this.write = function(text) {
    currentStep.append('<pre class="embedded-text">' + text + '</pre>');
  };

  this.before = function(before) {
    if(before.status != 'passed') {
      currentElement = featureElement({keyword: 'Before', name: '', description: ''}, 'before');
      currentStepIndex = 1;
      populateStepError($('details', currentElement), before.error_message);
    }
  };

  this.after = function(after) {
    if(after.status != 'passed') {
      currentElement = featureElement({keyword: 'After', name: '', description: ''}, 'after');
      currentStepIndex++;
      populateStepError($('details', currentElement), after.error_message);
    }
  };

  function featureElement(statement, itemtype) {
    var e = blockElement(currentFeature.children('details'), statement, itemtype);

    currentSteps = $('.steps', $templates).clone();
    currentSteps.appendTo(e.children('details'));

    return e;
  }

  function blockElement(parent, statement, itemtype) {
    var e = $('.blockelement', $templates).clone();
    e.appendTo(parent);
    return populate(e, statement, itemtype);
  }

  function populate(e, statement, itemtype) {
    populateTags(e, statement.tags);
    populateComments(e, statement.comments);
    e.find('.keyword').text(statement.keyword);
    e.find('.name').text(statement.name);
    e.find('.description').text(statement.description);
    e.attr('itemtype', 'http://cukes.info/microformat/' + itemtype);
    e.addClass(itemtype);
    return e;
  }

  function populateComments(e, comments) {
    if (comments !== undefined) {
      var commentsNode = $('.comments', $templates).clone().prependTo(e.find('.header'));
      $.each(comments, function(index, comment) {
        var commentNode = $('.comment', $templates).clone().appendTo(commentsNode);
        commentNode.text(comment.value);
      });
    }
  }

  function populateTags(e, tags) {
    if (tags !== undefined) {
      var tagsNode = $('.tags', $templates).clone().prependTo(e.find('.header'));
      $.each(tags, function(index, tag) {
        var tagNode = $('.tag', $templates).clone().appendTo(tagsNode);
        tagNode.text(tag.name);
      });
    }
  }

  function populateStepError(e, error) {
    if (error !== undefined) {
      errorNode = $('.error', $templates).clone().appendTo(e);
      errorNode.text(error);
    }
  }
};

CucumberHTML.templates = '<div>\
  <section class="blockelement" itemscope>\
    <details open>\
      <summary class="header">\
        <span class="keyword" itemprop="keyword">Keyword</span>: <span itemprop="name" class="name">This is the block name</span>\
      </summary>\
      <div itemprop="description" class="description">The description goes here</div>\
    </details>\
  </section>\
\
  <ol class="steps"></ol>\
\
  <ol>\
    <li class="step"><span class="keyword" itemprop="keyword">Keyword</span><span class="name" itemprop="name">Name</span></li>\
  </ol>\
\
  <pre class="doc_string"></pre>\
\
  <pre class="error"></pre>\
\
  <table class="data_table">\
    <tbody>\
    </tbody>\
  </table>\
\
  <table class="examples_table">\
    <thead></thead>\
    <tbody></tbody>\
  </table>\
\
  <section class="embed">\
    <img itemprop="screenshot" class="screenshot" />\
  </section>\
  <div class="tags"></div>\
  <span class="tag"></span>\
  <div class="comments"></div>\
  <div class="comment"></div>\
<div>';

if (typeof module !== 'undefined') {
  module.exports = CucumberHTML;
} else if (typeof define !== 'undefined') {
  define([], function() { return CucumberHTML; });
}
