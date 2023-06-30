local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

FadingContour.sync_contour_index = ContourExt and table.index_of(ContourExt.indexed_types, FadingContour.sync_contour)

local fc_original_unitnetworkhandler_sync_contour_remove = UnitNetworkHandler.sync_contour_remove
function UnitNetworkHandler:sync_contour_state(unit, u_id, type_index, sender_rpc)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

	if type == FadingContour.sync_contour_index and alive(unit) then
		unit:contour():fade_color(multiplier / 8)
		return
	end

	fc_original_unitnetworkhandler_sync_contour_remove(self, unit, u_id, type_index, sender_rpc)
end
