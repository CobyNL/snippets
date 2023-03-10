        -- Sort both arrays so stuff doesn't get mixed up
        table.sort(sendData, function(a,b) return a.label < b.label end)
        table.sort(nuiData, function(a,b) return a.label < b.label end)