document.addEventListener('click', (e) => {
     if (e.target.classList.contains('fileDel')) {
          let uuid = e.target.dataset.uuid;
          removeFile(uuid).then(result => {
               console.log(result);
               alert('파일삭제' + (parseInt(result) > 0 ? '완료' : '실패'));
               if (parseInt(result)) {
                    e.target.closest('li').remove();
                    location.reload();
               }
          })
     }
})

async function removeFile(uuid) {
     const url = '/board/file/' + uuid;
     const config = {
          method: 'delete'
     };
     const resp = await fetch(url, config);
     const result = await resp.text();
     return result;
}