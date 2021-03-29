<?php

Route::group(['prefix' => 'v1', 'namespace' => 'Api', 'as' => 'api.', 'middleware' => []], function () {
    Route::post('products/search', ['as' => 'products.search', 'uses' => 'ProductsController@search']);
});

/*
Route::group(['prefix' => '/v1', 'namespace' => 'Api\V1', 'as' => 'api.'], function () {

});
*/
