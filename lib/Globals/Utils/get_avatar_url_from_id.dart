List avatars = [
  {
    "id": 1,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-1.svg?alt=media&token=d83f4330-a93b-4286-a2dc-66cf6f527de8",
    "createTime": "2022-03-31T20:31:35.060681Z"
  },
  {
    "id": 2,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-5.svg?alt=media&token=1c1860d9-4011-444d-9399-f8c36587efb8",
    "createTime": "2022-03-31T20:57:30.322055Z"
  },
  {
    "id": 3,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-6.svg?alt=media&token=e56e2ab3-46c3-4301-b7cf-28e5f1198570",
    "createTime": "2022-03-31T20:57:42.088644Z"
  },
  {
    "id": 4,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-7.svg?alt=media&token=1208304f-13e7-4250-89ff-2fa42a921f09",
    "createTime": "2022-03-31T20:57:51.112755Z"
  },
  {
    "id": 5,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-8.svg?alt=media&token=23d7c13e-6617-4360-b831-8cde64360fe8",
    "createTime": "2022-03-31T20:57:59.112604Z"
  },
  {
    "id": 6,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-9.svg?alt=media&token=eead1a4f-6cf7-4b80-a660-5ee9b3c3b9d3",
    "createTime": "2022-03-31T20:58:06.566968Z"
  },
  {
    "id": 7,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-10.svg?alt=media&token=d569d1cb-a1d4-4c37-b419-b015671aa238",
    "createTime": "2022-03-31T20:58:13.041562Z"
  },
  {
    "id": 8,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-11.svg?alt=media&token=9580cc04-ddfe-4772-a2ad-c54e1bc0a3a6",
    "createTime": "2022-03-31T20:58:18.852237Z"
  },
  {
    "id": 9,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-12.svg?alt=media&token=9fcce0f8-8b4b-4f4a-b95d-fcf9da240116",
    "createTime": "2022-03-31T20:58:25.065926Z"
  },
  {
    "id": 10,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-13.svg?alt=media&token=e2b070e6-b362-4760-8ce7-1d89392244bf",
    "createTime": "2022-03-31T20:58:29.598064Z"
  },
  {
    "id": 11,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-14.svg?alt=media&token=522e697e-3bf3-4959-8d9f-97e8d80473d3",
    "createTime": "2022-03-31T20:58:34.523105Z"
  },
  {
    "id": 12,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-15.svg?alt=media&token=64c9a4c2-0217-432b-8053-c9da65958bd3",
    "createTime": "2022-03-31T20:58:39.789542Z"
  },
  {
    "id": 13,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-16.svg?alt=media&token=31170273-8dc0-4e60-ae1d-1eaf31d1d73a",
    "createTime": "2022-03-31T20:58:45.305861Z"
  },
  {
    "id": 14,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-2.svg?alt=media&token=bbd77259-15a8-4ce2-9aa6-926de90dc25b",
    "createTime": "2022-03-31T20:58:49.634335Z"
  },
  {
    "id": 15,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-3.svg?alt=media&token=a633ca26-c4e3-4f72-84b1-b28bed799f34",
    "createTime": "2022-03-31T20:58:54.089557Z"
  },
  {
    "id": 16,
    "avatarUrl":
        "https://firebasestorage.googleapis.com/v0/b/ai-development-a93cb.appspot.com/o/users-4.svg?alt=media&token=afcc0285-015c-496d-a32a-04b9c4b7a113",
    "createTime": "2022-03-31T20:58:58.133847Z"
  }
];
String getAvatarUrlFromId(int id) {
  String url = "";
  avatars.forEach((element) {
    if (element['id'] == id) {
      url = element['avatarUrl'];
    }
  });
  return url;
}
