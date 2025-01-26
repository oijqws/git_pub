
# 获取动画帧信息

extends AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"."

func _ready() -> void:
	# 获取所有动画名称
	var animations = sprite_frames.get_animation_names()
	
	# 遍历每个动画
	for anim_name in animations:
		print("动画: ", anim_name)
		var frame_count = sprite_frames.get_frame_count(anim_name)
		print("总共%d帧" % frame_count)
		
		# 遍历该动画的所有帧
		for frame_idx in range(frame_count):
			var atlas_texture = sprite_frames.get_frame_texture(anim_name, frame_idx) as AtlasTexture
			if atlas_texture:
				var region = atlas_texture.region
				print("%d帧 位置(%.0f,%.0f)" % [frame_idx, region.position.x/region.size.x, region.position.y/region.size.y])
				print("大小(%.0f,%.0f)" % [region.size.x, region.size.y])
				break # 只打印第一帧
		
		print("================================================")
