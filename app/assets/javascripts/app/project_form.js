App.addChild('ProjectForm', _.extend({
  el: 'form#project_form',

  events: {
    'blur input' : 'checkInput',
  },

  activate: function(){
    this.setupForm();
  }

}, Skull.Form));

// Put subview here to avoid dependency issues

App.views.ProjectForm.addChild('VideoUrl', _.extend({
  el: 'input#project_video_url',

  events: {
    'timedKeyup' : 'checkVideoUrl'
  },

  checkVideoUrl: function(){
    var that = this;
    $.get(this.$el.data('path') + '?url=' + encodeURIComponent(this.$el.val())).success(function(data){
      if(!data || !data.video_id){
        that.$el.trigger('invalid');
      }
    });
  },

  activate: function(){
    this.setupTimedInput();
  }
}, Skull.TimedInput));

App.views.ProjectForm.addChild('Permalink', _.extend({
  el: 'input#project_permalink',

  events: {
    'timedKeyup' : 'checkPermalink',
  },

  checkPermalink: function(){
    // var that = this;
    // if(this.re.test(this.$el.val())){
    //   $.get('/pt/' + this.$el.val()).complete(function(data){
    //     if(data.status != 404){
    //       that.$el.trigger('invalid');
    //     }
    //   });
    // }
  },

  activate: function(){
    this.re = new RegExp(this.$el.prop('pattern'));
    this.setupTimedInput();
  }
}, Skull.TimedInput));

App.views.ProjectForm.addChild('ProjectName', _.extend({
  el: 'input#project_name',

  events: {
    'blur' : 'fillSuggestionForPermalink',
  },

  fillSuggestionForPermalink: function(){
    var that = this;
    if (_.isString(that.el.value) && that.el.value !== "") {
      var suggestedPermalink = that.el.value.latinise();
      suggestedPermalink = suggestedPermalink.toLowerCase()
      suggestedPermalink = suggestedPermalink.replace(/\s/g, "-");
      suggestedPermalink = suggestedPermalink.replace(/:/g, "-");
      $("input#project_permalink").val(suggestedPermalink);
    }
  },

  activate: function(){
    this.re = new RegExp(this.$el.prop('pattern'));
    this.fillSuggestionForPermalink();
  }
}, Skull.ProjectName));

