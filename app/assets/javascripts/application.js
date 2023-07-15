document.addEventListener('DOMContentLoaded', function() {
    const contElement = document.querySelector('.cont');
    const noticeElement = document.querySelector('.notice');
    
    if (contElement.textContent.trim().length === 0) {
      noticeElement.style.display = 'none';
    } else {
      noticeElement.style.display = 'block';
    }
  });
  