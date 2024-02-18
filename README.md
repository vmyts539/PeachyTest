**Comment from company**:
1.**To make code more DRY:**

load_and_authorize_resource should be used instead of separate call authorize! method.

2.Serializers should resides in it's corresponding folders:

Api::V1

Instaed of this:

UserSerializer.new(current_user).serializable_hash[:data][:attributes]

Should be:

render json: current_user, status: :ok, serializer: Api::V1::UserSerializer

![image](https://github.com/vmyts539/PeachyTest/assets/33605808/a838928f-db80-4494-baa1-787e8c19309c)
![image](https://github.com/vmyts539/PeachyTest/assets/33605808/a4b070c9-e172-4332-b602-9bdd5a5fd7d8)
![image](https://github.com/vmyts539/PeachyTest/assets/33605808/6e38fe72-fc7b-4ca9-a616-d52ff32edf2c)
![image](https://github.com/vmyts539/PeachyTest/assets/33605808/f05cfbae-0da3-482f-8b87-1b325201e38c)
![image](https://github.com/vmyts539/PeachyTest/assets/33605808/c482e24d-04f9-4bac-b34b-bcf25bafe356)
