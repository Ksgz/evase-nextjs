export default function Success() {
    return <div>Form successfully submitted!</div>
  }
  export default function ContactForm() {
    return (
+     <form name="contact" action="/success" method="POST" data-netlify="true">
        <input type="hidden" name="form-name" value="contact" />
        <p>
          <label>
    ...