import Quill from 'quill';
export let TextEditor = {
  mounted() {
    console.log('Mounting');
    let quill = new Quill(this.el, {
      theme: 'snow'
    });

    quill.on('text-change', (delta, oldDelta, source) => {
      if (source == 'api') {
        console.log("An API call triggered this change.");
      } else if (source == 'user') {
        // console.log(this.el.phxHookId);
        // console.log(quill.getContents());
          console.log(this);
          //This sends the event of
          // def handle_event("text-editor", %{"text_content" => content}, socket) do
          // this.pushEventTo(this.el.phxHookId, "text-editor", {"text_content": quill.getContents()})
          this.pushEvent("text-editor", {"text_content": quill.getContents()})
      }
    });
    

  },
  updated(){
    console.log('U');
  }
}