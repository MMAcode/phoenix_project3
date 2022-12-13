import Quill from 'quill';
export let TextEditor = {
    mounted() {
        console.log('Mounting');

        // console.log('miroPost:', miroPost);

        let quill = new Quill(this.el, {
            modules: {
                toolbar: [
                    [{ 'header': [1, 2, false] }],
                    ['bold', 'italic', 'underline', 'strike', 'blockquote'],
                    [{ 'list': 'ordered' }, { 'list': 'bullet' }, { 'indent': '-1' }, { 'indent': '+1' }],
                    ['link'], // ['link', 'image'],
                    ['clean']
                ]
            },
            theme: 'snow'
        });

        // https://quilljs.com/docs/api/#setcontents
        // quill.setContents(delta: Delta, source: String = 'api'): Delta
        // dbData = { "ops": [{ "insert": "xx\n" }] }
        // quill.setContents(dbData)
        // quill.setContents({ "ops": [{ "insert": "xox\n" }] })

        quill.on('text-change', (delta, oldDelta, source) => {
            if (source == 'api') {
                console.log("An API call triggered this change.");
            } else if (source == 'user') {
                // console.log(this.el.phxHookId);
                // console.log(quill.getContents());
                //   console.log(this);
                //This sends the event of
                // def handle_event("text-editor", %{"text_content" => content}, socket) do
                // this.pushEventTo(this.el.phxHookId, "text-editor", {"text_content": quill.getContents()})
                this.pushEvent("text-editor", { "text_content": quill.getContents() })

            }
        });

        window.addEventListener("phx:miroFromServer", (e) => {
            // let el = document.getElementById(e.detail.id)
            // if (el) {
            // logic for highlighting
            // }
            console.log("miro: e from server received:", e)
            console.log("miro: quill data:", e.detail.savedQuill)
            quill.setContents({ "ops": [{ "insert": "xox2\n" }] })
        })


    },
    updated() {
        console.log('U');
    }
}