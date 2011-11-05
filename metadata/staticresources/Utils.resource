(function(){

    // usage: log('inside coolFunc', this, arguments);
    // paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
    window.log = function(){
      log.history = log.history || [];   // store logs to an array for reference
      log.history.push(arguments);
      arguments.callee = arguments.callee.caller;
      if(this.console) console.log( Array.prototype.slice.call(arguments) );
    };
    // make it safe to use console.log always
    (function(b){function c(){}for(var d="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),a;a=d.pop();)b[a]=b[a]||c})(window.console=window.console||{});


    // Save a reference to the global object.
    var root = this;

    // Our top-level namespace.
    if (root.Utils == null){
        root.Utils = {};
    }
    var Utils = root.Utils;

    // Make sure we have what we need
    if (root.jQuery === 'undefined'){
        throw new Error('jQuery is required!');
    }

    //Modernizr doesn't support progress elements yet,
    //but is in this fork https://github.com/dpkendal/Modernizr
    //so let's add support for testing for HTML5 progress
    Modernizr.addTest("progress", function(){
        return ('value' in document.createElement('progress'));
    });

}).call(this);