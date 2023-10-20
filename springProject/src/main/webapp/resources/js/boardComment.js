console.log(bnoVal);

async function CommentPostToServer(cmtData) {
     try {
          const url = "/comment/post";
          const config = {
               method: "post",
               headers: {
                    "content-type": "application/json; charset=utf-8"
               },
               body: JSON.stringify(cmtData)
          };
          const resp = await fetch(url, config);
          const result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}

document.getElementById('cmtPostBtn').addEventListener('click', () => {
     const cmtWriter = document.getElementById('cmtWriter').innerText;
     const cmtText = document.getElementById('cmtText').value;

     if (cmtText == "" || cmtText == null) {
          alert('댓글을 입력해주세요.');
          document.getElementById('cmtText').focus();
          return false;
     } else {
          let cmtData = {
               bno: bnoVal,
               writer: cmtWriter,
               content: cmtText
          };
          console.log(cmtData);
          CommentPostToServer(cmtData).then(result => {
               if (result == 1) {
                    alert('댓글 등록 성공!');
                    CommentList(bnoVal);
               } else {
                    alert('댓글 등록 실패!');
               }
          })
     }
})

async function spreadCommentList(bno) {
     try {
          const resp = await fetch("/comment/" + bno);
          const result = await resp.json();
          return result;
     } catch (error) {
          console.log(error);
     }
}

function CommentList(bno) {
     spreadCommentList(bno).then(result => {
          let ul = document.getElementById('cmtListArea');
          ul.innerHTML = "";
          for (let cvo of result) {
               let li = `<li class="list-group-item" data-cno=${cvo.cno}>`;
               li += `<div class="mb-3">`;
               li += `<div class="fw-bold">${cvo.writer}</div>`;
               li += `${cvo.content}</div>`;
               li += `<span class="badge rounded-pill text-bg-info">${cvo.modAt}</span><br>`;
               li += `<button type="button" class="btn btn-warning modBtn" data-bs-toggle="modal" data-bs-target="#myModal">Mod</button>`;
               li += `<button type="button" class="btn btn-danger delBtn">Del</button>`;
               li += `</li>`;
               ul.innerHTML += li;
          }
     })
}

async function removeComment(cno) {
     const url = "/comment/" + cno;
     const config = {
          method: "delete"
     };
     const resp = await fetch(url, config);
     const result = await resp.text();
     return result;
}

document.addEventListener('click', (e) => {
     console.log(e.target);
     if (e.target.classList.contains('delBtn')) {
          let li = e.target.closest('li')
          let cnoVal = li.dataset.cno;
          removeComment(cnoVal).then(result => {
               if (result == 1) {
                    alert('댓글 삭제 성공!');
               } else {
                    alert('댓글 삭제 실패!');
               }
               CommentList(bnoVal);
          })
     }
})