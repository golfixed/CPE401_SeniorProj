import http from "../http-common";

class UploadFilesService {
  uploadProfilePic(file, onUploadProgress) {
    let imgProfile = new imgProfile();

    imgProfile.append("pic", pic);

    return http.post("/uploadprofile", imgProfile, {
      headers: {
        "Content-Type": "multipart/form-data"
      },
      onUploadProgress
    });
  }

  getFiles() {
    return http.get("/files");
  }
}

export default new UploadFilesService();