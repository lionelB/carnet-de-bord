<script lang="ts">
	import type {
		Beneficiary,
		OrientationManager,
		Professional,
	} from '$lib/graphql/_gen/typed-document-nodes';
	import { openComponent } from '$lib/stores';
	import { formatDateLocale } from '$lib/utils/date';
	import { Button, IconButton } from '$lib/ui/base';
	import { displayFullName, displayMobileNumber } from '$lib/ui/format';
	import { Text } from '$lib/ui/utils';
	import ProNotebookPersonalInfoUpdate from './ProNotebookPersonalInfoUpdate.svelte';

	type Pro =
		| Pick<Professional, 'firstname' | 'lastname'>
		| Pick<OrientationManager, 'firstname' | 'lastname'>;

	export let beneficiary: Pick<
		Beneficiary,
		| 'id'
		| 'firstname'
		| 'lastname'
		| 'mobileNumber'
		| 'email'
		| 'dateOfBirth'
		| 'address1'
		| 'address2'
		| 'city'
		| 'postalCode'
		| 'cafNumber'
		| 'peNumber'
	>;
	export let lastUpdateDate: string;
	export let lastUpdateFrom: Pro;

	function edit() {
		openComponent.open({ component: ProNotebookPersonalInfoUpdate, props: { beneficiary } });
	}
</script>

<div class="flex flex-col space-y-6 pt-2">
	<div>
		{#if lastUpdateDate}
			<div class="text-sm">
				Informations mises à jour le {formatDateLocale(lastUpdateDate, {
					year: 'numeric',
					month: 'long',
					day: 'numeric',
				})} par
				{displayFullName(lastUpdateFrom)}
			</div>
		{/if}
		<div class="flex">
			<h1 class="fr-h1 flex-1 text-france-blue">
				{displayFullName(beneficiary)}
			</h1>
			<div>
				<IconButton
					on:click={() => window.print()}
					icon="fr-icon-printer-line"
					class="fr-btn--tertiary"
					title="Imprimer"
				/>
			</div>
		</div>
		<div class="-mt-2">Né le {formatDateLocale(beneficiary.dateOfBirth)}</div>
	</div>

	<h2 class="fr-h4 text-france-blue">Informations personnelles</h2>
	<!-- extract Infos -->
	<div class="flex flex-row space-x-4">
		<div class="w-full">
			<div class="text-lg font-bold">
				<Text
					value={displayMobileNumber(beneficiary)}
					defaultValue="Pas de téléphone"
					defaultValueClassNames={'italic'}
				/>
			</div>
			<div>
				<Text
					value={beneficiary.email}
					defaultValue="Pas d'email"
					defaultValueClassNames={'italic'}
				/>
			</div>
			<address class="mt-2 not-italic">
				{@html [beneficiary.address1, beneficiary.address2]
					.filter((field) => Boolean(field))
					.concat(
						[beneficiary.postalCode, beneficiary.city].filter((field) => Boolean(field)).join(' ')
					)
					.join('<br>')}
			</address>
		</div>
		<div class="w-full">
			<strong class="text-base text-france-blue">Identifiant Pôle emploi</strong>
			<Text class="mb-2" value={beneficiary.peNumber} />
			<strong class="text-france-blue">Identifiant CAF/MSA</strong>
			<Text value={beneficiary.cafNumber} />
		</div>
	</div>
	<Button classNames="self-start" on:click={() => edit()} outline>Mettre à jour</Button>
</div>
