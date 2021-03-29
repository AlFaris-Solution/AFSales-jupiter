<tr>
    <th></th>
    <th>{{ $jmlKwt }}</th>
    <th>-</th>
    <th>@currency($jmlTotalTagihan)</th>
    <?php 
        $rows = []; ?>
    @foreach ($columns as $key => $column)
    <?php
        $row = [];
        array_push($rows, $row); ?>
        @foreach ($column as $cell)
            @for ($i = 0; $i < count($cell->groupBy('tgl_bayar')); $i++)
                <?php 
                    array_push($rows[$key], $cell->sum('jml_bayar')); ?>
            @endfor
        @endforeach
    @endforeach
    
    @if ($columnIsValid == 1)
    @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
    @elseif ($columnIsValid == 2)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>                                  
        <th colspan="3">@currency($totalTertagih2)</th>
    @elseif ($columnIsValid == 3)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
    @elseif ($columnIsValid == 4)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
    @elseif ($columnIsValid == 5)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
    @elseif ($columnIsValid == 6)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0;
            $totalTertagih6 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0;
                $totalTertagih6 += $row[5] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
        <th colspan="3">@currency($totalTertagih6)</th>
    @elseif ($columnIsValid == 7)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0;
            $totalTertagih6 = 0;
            $totalTertagih7 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0;
                $totalTertagih6 += $row[5] ?? 0;
                $totalTertagih7 += $row[6] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
        <th colspan="3">@currency($totalTertagih6)</th>
        <th colspan="3">@currency($totalTertagih7)</th>
    @elseif ($columnIsValid == 8)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0;
            $totalTertagih6 = 0;
            $totalTertagih7 = 0;
            $totalTertagih8 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0;
                $totalTertagih6 += $row[5] ?? 0;
                $totalTertagih7 += $row[6] ?? 0;
                $totalTertagih8 += $row[7] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
        <th colspan="3">@currency($totalTertagih6)</th>
        <th colspan="3">@currency($totalTertagih7)</th>
        <th colspan="3">@currency($totalTertagih8)</th>
    @elseif ($columnIsValid == 9)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0;
            $totalTertagih6 = 0;
            $totalTertagih7 = 0;
            $totalTertagih8 = 0;
            $totalTertagih9 = 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0;
                $totalTertagih6 += $row[5] ?? 0;
                $totalTertagih7 += $row[6] ?? 0;
                $totalTertagih8 += $row[7] ?? 0;
                $totalTertagih9 += $row[8] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
        <th colspan="3">@currency($totalTertagih6)</th>
        <th colspan="3">@currency($totalTertagih7)</th>
        <th colspan="3">@currency($totalTertagih8)</th>
        <th colspan="3">@currency($totalTertagih9)</th>
    @elseif ($columnIsValid == 10)
        @for ($i = 0; $i < $columnIsValid; $i++)
            <?php 
            $totalTertagih1 = 0;
            $totalTertagih2 = 0;
            $totalTertagih3 = 0;
            $totalTertagih4 = 0;
            $totalTertagih5 = 0;
            $totalTertagih6 = 0;
            $totalTertagih7 = 0;
            $totalTertagih8 = 0;
            $totalTertagih9 = 0;
            $totalTertagih10= 0; ?>
            @foreach ($rows as $key => $row)
                <?php 
                $totalTertagih1 += $row[0] ?? 0;
                $totalTertagih2 += $row[1] ?? 0;
                $totalTertagih3 += $row[2] ?? 0;
                $totalTertagih4 += $row[3] ?? 0;
                $totalTertagih5 += $row[4] ?? 0;
                $totalTertagih6 += $row[5] ?? 0;
                $totalTertagih7 += $row[6] ?? 0;
                $totalTertagih8 += $row[7] ?? 0;
                $totalTertagih9 += $row[8] ?? 0;
                $totalTertagih10+= $row[9] ?? 0; ?>
            @endforeach
        @endfor
        <th colspan="3">@currency($totalTertagih1)</th>
        <th colspan="3">@currency($totalTertagih2)</th>
        <th colspan="3">@currency($totalTertagih3)</th>
        <th colspan="3">@currency($totalTertagih4)</th>
        <th colspan="3">@currency($totalTertagih5)</th>
        <th colspan="3">@currency($totalTertagih6)</th>
        <th colspan="3">@currency($totalTertagih7)</th>
        <th colspan="3">@currency($totalTertagih8)</th>
        <th colspan="3">@currency($totalTertagih9)</th>
        <th colspan="3">@currency($totalTertagih10)</th>
    @endif
</tr>