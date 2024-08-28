local CRecipientFilter_Meta = FindMetaTable("CRecipientFilter")
if SERVER then
    local original_AddPAS = CRecipientFilter_Meta.AddPAS
    function CRecipientFilter_Meta:AddPAS(pos)
        pos = FVectorToVector(pos)
        original_AddPAS(self, pos)
    end
    local original_AddPVS = CRecipientFilter_Meta.AddPVS
    function CRecipientFilter_Meta:AddPVS(Position)
        Position = FVectorToVector(Position)
        original_AddPVS(self, Position)
    end
    local original_RemovePAS = CRecipientFilter_Meta.RemovePAS
    function CRecipientFilter_Meta:RemovePAS(position)
        position = FVectorToVector(position)
        original_RemovePAS(self, position)
    end
    local original_RemovePVS = CRecipientFilter_Meta.RemovePVS
    function CRecipientFilter_Meta:RemovePVS(pos)
        pos = FVectorToVector(pos)
        original_RemovePVS(self, pos)
    end
    
end
