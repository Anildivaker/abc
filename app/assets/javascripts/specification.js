document.addEventListener('DOMContentLoaded', function() {
    const contextType = document.getElementById('specification_context_type');
    const contextText = document.getElementById('specification_context_text_input');
    const contextArray = document.getElementById('specification_context_array_input');
    function Fields() {
      contextText.style.display = contextType.value === 'text' ? 'block' : 'none';
      contextArray.style.display = contextType.value === 'dropdown' ? 'block' : 'none';
    }
    contextType.addEventListener('change', Fields);
    Fields();
  });